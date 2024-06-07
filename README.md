# Research website

## [Title of Project]
This repository documents a research project conducted by Dr Shino Takayama and Dr Yuqing Liu from the School of Economics at the University of Queensland (UQ).  
Feel free to contact the researchers if you have any queries or are interested to know more. 
## Contact information
#### https://www.shinotakayama.com/
#### https://sites.google.com/view/yuqingliu/home

This website is created using Github pages to showcase the data, codes, and key results.
The creator of the website is Guan-Jia Huang, a research assistant. 


<!-- Remember, when you are creating a digital content,
it's better to use a plaintext file. Markdown is the
best format, as it can simply be turned into
HTML. And as we know, when it's HTML format, that's
the very consumption of web browsers, isn't it?

This also reinforces the writers to use GitHub
as their development site because it is more
efficient as it uses `git` to record the 
file's history. Even if Google Docs has a
similar version tracking, still `git`
cannot be replaced.

Now, here is the catch: when you want to distribute
your content as hard copy,
in Google Chrome, you can simply
right click the page and click `Print` 
you now have the PDF version of your content.
Also, say, you are creating content for another
website, you can simply embed the page and
your job is done. You have the repo as the 
active site for its development, maybe, others
will collaborate too, and then the GitHub Pages
generated page as the output. 
If ever you need a Google Docs
or Microsoft Word
version of this, simply copy the rendered
Markdown file of GitHub and paste it
on Google Docs or Microsoft Word, the format
will still be correct.

As you can see, it's very practical.

## How To
In the same way you keep your pages and assets in one
directory and subdirectories on the server, it is 
the same thing on GitHub Pages through a GitHub repository.

For a user, `<username>.github.io` is the pattern by default
so that GitHub Pages can build the site. Meaning, you should 
create a repository named after this pattern, 
so mine is `xdvrx1.github.io`. 
My site will be automatically created. 
However, you may skip initializing your root directory.

A default document will be displayed when a visitor requests
the site's URL. This is the `index.htm` file (or `index.html`
to make sure other platforms will read it correctly)
unless you change this manually for the server to give
a different default document.
It is the same in GitHub Pages plus the `README.md`
or `index.md`.
So, when you create a repo for GitHub Pages,
you may have one default document from the three options:

- `index.htm` or `index.html`
- `README.md`
- `index.md`

When you create a subdirectory,
they are still the choices for the 
default document. The big advantage of using pure HTML
is the freedom to design your page.

There are three places where GitHub Pages will be building
your site from: `main`, `gh-pages` or `/docs`. 

- Using the `main`
branch, there is no additional effort, 
just set the proper configuration in `Settings`. 

- `gh-pages` is a branch, 
to create this, go to `Branch`,
type in the box 'gh-pages'
then click the pop-up so that
it will be created.

- `/docs` is a subfolder of the main `branch`, 
just click `Create new file` then type 
'docs/index.htm' or any of the other
choices for the default document.
GitHub does not allow empty repository, 
so you must initialize it with a file.
In this example, that is `index.htm`. 

Furthermore, as I have observed when using just a regular
account and when there is no need to change the domain name,
it's just a matter of preference and technique where you
will be building your site among the three options.

But there are few considerations:
- First, the `main` branch can be the source when it's all
about building the site.

- Second, the `gh-pages` can be your choice when your `main`
branch is dedicated for your source codes. 

- Third, the `/docs` folder is a good choice when
you want to build your site from scratch where
you don't copy the contents of the `main` branch,
as in the case of `gh-pages` branch.

Changing the default address is another story, where
you really want to make sure that you 
have an existing domain. If you know how to host 
a site from your computer,
this will be very easy for you to do. So, 
if you don't know the process yet, you find time
studying how to host a website from a different source
because the idea is the same in GitHub Pages.
I provided the link at the bottom.

The themes provided by GitHub Pages can be used
for your pages. These themes will 
always work in Markdown files
but when you deal with pure HTML, make sure
that you always delete the head section and just include
the body so that the theme you selected will
be the one to take care of your page/s.

Then tell Jekyll that through

```
---
layout: default
---
```

on top of the HTML file.

***
> So, the steps are:
>
> 1. Create a GitHub account if there is none.
>
> 2. Create a repository or use an existing one.
For free accounts, GitHub does not allow you
to host from a private repo.
>
> 3. Go to `Settings` and look for GitHub Pages
at the left side, it's just `Pages`.
>
> 4. Select where GitHub Pages should build 
the pages, either from:
<kbd><img src="https://user-images.githubusercontent.com/47092464/115100185-abf2cd80-9f6d-11eb-85b4-1558a7335658.png" /></kbd>
>       - `main` (default)
>       - `gh-pages`
>       - `/docs`
>
> 5. And select a theme also if you want.
>
> 6. You visit the site provided. You now have your web page.

***

## The Trick
GitHub Pages generates a static site but 
don't you know that you can deploy games using this?
The trick is actually the code: if that is purely 
JavaScript, then it will work. To prove this, I deployed
demo games from Vanilla Web Projects using GitHub Pages:

<https://jdevstatic.github.io/hangman-game/>

<https://jdevstatic.github.io/breakout-game/>

As you can see here, because of the pure JavaScript,
it enables the site not to be static. Remember,
GitHub is referring to its being static 
for the server-side,
so you can't directly run, say, a PHP script. And
since JavaScript is browser-side scripting, it
will work as expected.


## Useful Links
For further details, pleaes visit these following sites:

<https://pages.github.com>

<https://help.github.com/en/articles/configuring-a-publishing-source-for-github-pages>

<https://help.github.com/en/articles/user-organization-and-project-pages>

And it is important to know how GitHub Pages
differs from WordPress:

<https://viktorsmari.github.io/2019/07/14/github-pages-vs-wordpress.html> 

For my very own example, this site 

<https://jdevstatic.github.io/C-Programming-Tutorial/>

was built by GitHub Pages,
Jekyll being the static site generator.
When you click `View on GitHub`, that is the repository
where all the assets and default documents reside. 
It's that simple. 

And, for those who don't know yet how to
host a site using a computer as a server,

<https://blog.mindorks.com/how-to-convert-your-laptop-desktop-into-a-server-and-host-internet-accessible-website-on-it-part-1-545940164ab9>

About custom domain in GitHub Pages:

<https://help.github.com/en/articles/using-a-custom-domain-with-github-pages>

<https://help.github.com/en/articles/custom-domain-redirects-for-github-pages-sites>


