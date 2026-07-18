# search-picker
A [simple HTML page](./search.html) for searching various web sites

I got annoyed sending all my searches to a search engine, when I usually just wanted to go to one of a few websites. I found this annoying for two reasons:

1. Privacy: I didn't like that Google knew everything I was searching for; and
2. ADHD: I am prone to distraction and irrelevent search results from other websites are distracting.

## Design Principles

* Simplicity
* Humility
* Focus
* Privacy

## Features

* Fast to load.
* Easy to use.
* Gets out of your way.
* Supports dark mode.

## Anti-Features

* This page is not "enagaging" or "sticky".
* It's not dynamic.
* It doesn't track you.
* It doesn't track anything.
* It doesn't remember your search history.
* It doesn't suggest searches.
* It doesn't suggest "trending" queries.

It occurred to me that the websites I usually want to go to already have their own search capabilites, so I can just search those sites. This simple static page to let me choose where to search. I use it as my default search engine in browsers that let me do that.

## How to Use

The page can be used by itself or you can configure your web browser to use it as a search engine.

* To use the page by itself, type your search terms in the text box then press the button for the site you want to search.

* To use it as a search engine, publish `search.html` and `opensearch.xml` together and register the page with your browser (see below). When you do a search from your browser, it opens this page and the text box contains the search query, waiting for you to choose where to send that query.

Web browsers don't send the `#` and everything after it in the URL to the web server, so the server serving the page won't actually receive the searches queries. The code in the page runs in the web browser and it can see the `#`. It uses that to populate the text box with the search text.

## Registering the Page as a Search Engine

The page advertises itself to browsers using [OpenSearch](https://developer.mozilla.org/en-US/docs/Web/XML/Guides/OpenSearch): a `<link rel="search">` tag in `search.html` pointing to `opensearch.xml` tells the browser the name and URL of the search engine. This works in both Chromium and Firefox.

OpenSearch requires the search URL in `opensearch.xml` to be absolute, so you have to edit it before publishing. Open `opensearch.xml` in any text editor and replace `https://example.com/` with wherever you publish it, keeping the `#{searchTerms}` suffix. For example, if `search.html` is served at `https://alice.example.org/search.html`, the URL lines would look like this:

```xml
  <Url type="text/html" template="https://alice.example.com/search.html#{searchTerms}"/>
  <Url type="application/opensearchdescription+xml" rel="self" template="https://alice.example.com/opensearch.xml" />
```

`install.sh` is my install script, but it might help you. It does the edit for me: it copies both files into `~/html` and rewrites the URL in `opensearch.xml` to the base URL passed as an argument, e.g. `./install.sh https://alice.example.org`. It requires `bash` and `sed`, so it works on Linux, macOS, or Windows only inside something like WSL or Git Bash. It publishes to the directory `~/html`. If that's not your setup, hand-editing is just as easy.

Then publish both files to that location and visit the page once in your browser:

* **Chromium** (Chrome, Edge, Vivaldi, ...) registers the engine automatically when you visit the page. It appears under Settings > Search engine > Manage search engines > Site search, where you can activate it or make it the default.
* **Firefox** (Zen, LibreWolf, Floorp, ...) shows an "Add search engine" option when you open the address bar drop-down or right-click the address bar while on the page. After adding it, you can make it the default under Settings > Search.

Registration only works over `http(s)`, not when opening the file directly from disk. In both browsers, making it the *default* search engine is a manual settings step.
