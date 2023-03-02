# GoogleBooksFinder
Small app that allows you to search for a book through the Google Book API

This app uses CosyNetwork as a dependecy to handle network request, which is a small and lightweight network framework written by David Jangdal


This app is built within 2 hours.
If 2 more hours were spent, it would have been extended with an image cache and better handling for image downloads.
Time would also have been spent on setting up a better architechture and a services-structure for future views to be added.
There would also be initial tests to start covering the app and setup a structure on how to build future tests.
A throttling for the search request would also be a good idea to not send a request for each key stroke.

From a product specification it would be good to know that only 10 books are being shown, so therefore some kind of pagination would be good to be added. Perhaps with an infinite scroll at the bottom