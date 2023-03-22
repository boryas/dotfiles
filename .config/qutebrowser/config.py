config.load_autoconfig()
c.url.searchengines = {
    'DEFAULT': 'https://search.brave.com/search?q={}',
    '!g': 'https://google.com/search?hl=en&q={}', 
    '!wk':      'https://en.wikipedia.org/wiki/{}',
}
