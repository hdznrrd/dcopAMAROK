#!/usr/bin/perl
#
# dcopAMAROK
# Amarok DCOP now-playing announce script
# Copyright (C) Gregor Jehle <gjehle@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining
# A copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# Without limitation the rights to use, copy, modify, merge, publish,
# Distribute, sublicense, and/or sell copies of the Software, and to
# Permit persons to whom the Software is furnished to do so, subject
# To the following conditions:
# 
# The above copyright notice and this permission notice shall be included
# In all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

package AMAROK;

IRC::register ("dcopAMAROK", "1.0", "", "");
IRC::add_command_handler("dcopamarok", "AMAROK::amarok_handler");

sub amarok_handler {
  $title = `dcop amarok player nowPlaying`;
  $url = `dcop amarok player encodedURL`;
  $album = `dcop amarok player album`;
  chomp($title); chomp($url); chomp($album);
  $title =~ s/_[^_]*_[^_]*_/ - /;
  if($url =~ /^http:/) { IRC::command("np: $title ($album)"); }
  else { IRC::command("np: $title"); }
  return 1;
}
