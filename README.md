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

* To use it as a search engine, publish the `search.html` page and configure the browser with a custom search engine. If the search page were available at `https://example.com/search.html`, the custom search URL would be `https://example.com/search.html#%s`. Then change the browser's default search to the custom search. When you do a search from your browser, it opens this page and the text box contains the search query, waiting for you to choose where to send that query.

Web browsers don't send the `#` and everything after it in the URL to the web server, so the server serving the page won't actually receive the searches queries. The code in the page runs in the web browser and it can see the `#`. It uses that to populate the text box with the search text.
