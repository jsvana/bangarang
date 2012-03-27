// Scanner
// By Kaleb Elwert

// C++ Standard Lib
#include <iostream>
#include <string>

// Boost
#include <boost/filesystem.hpp>
#include <boost/regex.hpp>
#include <boost/lexical_cast.hpp>

// Taglib
#include <tag.h>
#include <mp4file.h>
#include <mp4tag.h>
#include <mpegfile.h>
#include <id3v1tag.h>
#include <id3v2tag.h>

using namespace boost;
using namespace std;
using namespace TagLib;

int main(int argc, char *argv[]) {
	if (argc > 1) {
		filesystem::path current_dir;
		regex pattern(".*(mp3|m4a)$");
		for (int i = 1; i < argc; ++i) {
			current_dir = argv[i];
			cerr << current_dir << endl;
			for (filesystem::recursive_directory_iterator iter(current_dir), end; iter != end; ++iter) {
				const string name = iter->path().filename();
				smatch what;
				if (regex_match(name, what, pattern) && filesystem::is_regular_file(iter->path())) {
					string ext = what[1];
					string filename(what[0].first, what[0].second);
					transform(ext.begin(), ext.end(), ext.begin(), ::tolower);
					String album;
					String albumartist;
					String track;
					String trackartist;
					TagLib::uint tracknumber;
					TagLib::uint year;
					if (ext == "mp3") {
						MPEG::File file(iter->path().string().c_str());
						ID3v2::Tag *tag = file.ID3v2Tag();
						//ID3v1::Tag *tag = file.ID3v1Tag();
						if (tag) {
							track = tag->title();
							trackartist = tag->artist();
							album = tag->album();
							if (tag->frameListMap().contains("TPE2")) {
								albumartist = tag->frameListMap()["TPE2"].front()->toString();
							}
							tracknumber = tag->track();
							year = tag->year();
						}

					} else if (ext == "m4a") {
						MP4::File file(iter->path().string().c_str());
						MP4::Tag *tag = file.tag();
						if (tag) {
							track = tag->title();
							trackartist = tag->artist();
							album = tag->album();
							albumartist = tag->itemListMap()["aArt"].toStringList().toString(", ");
							tracknumber = tag->track();
							year = tag->year();
						}
					}

					string tn;
					if (tracknumber != 0) {
						tn = lexical_cast<string>(tracknumber);
					} else {
						tn = "";
					}
					string yr;
					if (year != 0) {
						yr = lexical_cast<string>(year);
					} else {
						yr = "";
					}
					cout << "TRACK " << iter->path().string() << "\t" << tn << "\t" << albumartist << "\t" << album << "\t" << yr << "\t" << trackartist << "\t" << track << "\n";
				}
			}
		}
		return 0;
	} else {
		cerr << "No dirs specified" << endl;
		return 1;
	}
}
