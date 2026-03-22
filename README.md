# FaiF 3.0 
Free as in Freedom is a book about the life of Richard Stallman written by Sam Williams in 2002.

Free as in Freedom 2.0 is a revised edition by Stallman perself in 2010.

Free as in Freedom 2.1 is a progressive collection the revised edition of 2010 in multiple languages (English, Finnish, Indian, etc.) on multiple formats (.epub, audiobook formats).

We seek to spread the word of software freedom in as many languages as possible and as many formats, ebook/audiobook sellers (Audible, Kindle, etc.) as possible.

Help is needed <3 contribute however you like and make it your own!

## Translations (decided to not use submodules)
- Russian: https://github.com/olegchir/freeasinfreedom-ru (markdown), https://github.com/jollheef/free-as-in-freedom-v2-ru (tex)
- Simplified Chinese: https://github.com/lifanxi/free-as-in-freedom-zh-cn 
## Roadmap (Move to Projects and Issues once project expands)
- [ ] Clean up the pdfToEpub en version so that translations can be started with a clean copy
- [ ] Conform EPUB a11y 1.1
- [ ] Add FreeSans after scanning book what are used (normal, bold, italic, italic-bold)
- [ ] Record English audiobook with my SM7B clone
- [ ] Translate epub to Finnish
- [ ] Record the Finnish audiobook 

## Diary (Will delete this once we have more active contributors)
### 2025 Jul 15
It seems like my source epub of 2.0 is just a transcode from the 2.0 pdf to epub inside Calibre. Might require a lot of cleaning up to do now that ace also knows about the accessibility issues on the book. Yeaah this definitely confirms the pdf theory
> \<meta content="faif-2.0.tex" name="src"/>

Oh boy do I have a lot of cleaning up (bikesheddink) ahead of me.
### 2025 Jul 13
not sure should i gitignore .pdf and .epub. At the same time I don't want "duplicate" data i.e. epub and unarchived epub code but at the same time I might not also want to use the Release page of GitHub and a maintenance-needing CICD pipeline on GHActions. Not sure how I should collaborate with jollheef or should I just leave their project alone.
