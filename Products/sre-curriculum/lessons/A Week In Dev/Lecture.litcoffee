# A Week In Dev: Part of The Code Lifecycle

There are as many ways to develop software as there are developers. This
lesson covers some of the most recent best practices Robert has experienced.

## Lesson goals

This lesson covers some tasks a programmer might undertake within a typical
[Agile Development](https://en.wikipedia.org/wiki/Agile_software_development)
iteration.

Students will gain experience in:

  - obtaining and exploring existing code
  - writing and running tests
  - fixing bugs
  - adding features
  - reviewing changes
  - refactoring

## Meet The Project

The first step is to fetch and examine the files associated with the project
you are participating in. Your team will likely give you specific
instructions. What follows are somewhat specific to this lesson.

_How one organizes one's workspaces is a personal thing and what follows is
only a starting point._

If you don't have one already, create a directory structure to house your
workspaces:

```sh
cd ~
mkdir -p ws/github/thatsnice
cd $_
```

Next clone the project:


```sh
git clone git@github.com:thatsnice/PurityTest
cd PurityTest
```

Take a look at all the (non-hidden) files in the project:

```sh
find * -type f
```

As of this writing, these are the files:

- `Cakefile`
  - Defines some frequently used commands
- `LICENSE`
  - Public declaration of licensing terms of the project
- `README.md`
  - An overview of the project, also visible at the repository's [main page](https://github.com/thatsnice/PurityTest)
  - Note that it includes a *Dependencies* section which includes a step for installing CoffeeScript globally.
- `package.json`
  - Project name, description, dependencies, etc.
- `public/css/main.css`
  - User interface style
- `public/index.html`
  - User interface HTML
- `src/main.coffee`
  - Starting point of the project code
- `src/quiz.coffee`
  - Quiz data in code form
  - This is not a best practice! Data should be in data form to simplify security analysis and so the data can be easily manipulated with other tools.

At this point you may wish to view `index.html` to trace the logic of the
project. In this case, `index.html` includes `main.js` via a `<script>` tag.
`main.js` is generated from `main.coffee` via the `cake build` command which
is defined in `Cakefile`. You can see this in action now:

```
$ cake build
Nothing to clean
Compiling CoffeeScript to ECMAScript...


done.
```

_If you got an error about 'cake' not being a command or something, see Depenendices in README.md._

You can see the new files in `public/js`:

```
$ find public/js
public/js
public/js/main.js
public/js/quiz.js
```

Students more familiar with ECMAScript than CoffeeScript may be interested in
comparing `main.js` to `main.coffee`. See [the CoffeeScript
website](http://coffeescript.org) for more information.


