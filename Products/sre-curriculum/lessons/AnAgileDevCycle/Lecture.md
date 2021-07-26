# A Week In Dev: Part of The Code Life Cycle

There are as many ways to develop software as there are developers. This
lesson covers some of the most recent best practices Robert has experienced.

## Lesson goals

This lesson covers some tasks a programmer might undertake within a typical
[Agile Development](https://en.wikipedia.org/wiki/Agile_software_development)
iteration.

Students will gain experience in:

  - obtaining and exploring existing code
  - making changes
  - writing and running tests
  - fixing bugs
  - adding features
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

```console
$ cake build
Nothing to clean
Compiling CoffeeScript to ECMAScript...


done.
```

_If you got an error about 'cake' not being a command or something, see Depenendices in README.md._

You can see the new files in `public/js`:

```console
$ find public/js
public/js
public/js/main.js
public/js/quiz.js
```

Students more familiar with ECMAScript than CoffeeScript may be interested in
comparing `main.js` to `main.coffee`. See [the CoffeeScript
website](http://coffeescript.org) for more information.


## Making changes

### Example

```console
$ git pull
Already up to date.
$ vi Cakefile
$ git diff
diff --git a/Cakefile b/Cakefile
index 0a4cc80..d5f938b 100644
--- a/Cakefile
+++ b/Cakefile
@@ -6,9 +6,6 @@ defaults =
   OUTPUT_DIR : "public/js"
   INPUT_DIR  : "src"

-task 'test', 'Run all tests', (options) ->
-  require './t/all'
-
 doCmd = (cmd) ->
   new Promise (resolve, reject) ->
     child_process
@@ -31,6 +28,15 @@ dirExists = (path) ->

 makeDir = (path) -> doCmd "mkdir -p #{path}"

+task 'test', 'Run all tests', (options) ->
+  { OUTPUT_DIR
+    INPUT_DIR
+  } = Object.assign {}, defaults, options
+
+  await invoke 'build'
+
+  require './t/all'
+
 task 'init', 'Install dependencies, setup dirs', (options) ->
   { OUTPUT_DIR
     INPUT_DIR
$ git add Cakefile
$ git commit
$ git push
Enumerating objects: 14, done.
Counting objects: 100% (14/14), done.
Delta compression using up to 12 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1000 bytes | 1000.00 KiB/s, done.
Total 8 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To github.com:thatsnice/PurityTest
   eceb3f2..3f90701  main -> main
$ 
```

### Discussion

Code, data and documentation are kept in a Version Control System (VCS). This
provides the following benefits:

- multiple change-level undo
- logging of who changed what, when and why
- merging the work of multiple contributors is easier

The steps for creating a change to a repository (code or otherwise) are:

- Obtain or synchronize your copy of the repository you're working in
- Edit files
- Commit changes
- Push changes

The `git clone` command in the Meet the Project section is one way to start a
new workspace. If you already have a workspace you can obtain any changes
pushed by others by executing a `git pull` from anywhere within the workspace.

Regarding the editing, in general it's best to make small changes which are
"obviously correct." This isn't always possible, it's just a target to aim
for. It is also good to separate unrelated changes. For example, changes which
are strictly re-formatting should not be combined with functional changes.
It's OK to include white space changes which are necessitated by the syntax of
the code you're editing. Most change review tools are smart enough to hide
white space changes which do not change the meaning of the code.

Once you have finished your change you can review it with `git diff`. If you
find it satisfactory you can commit it to your local cache with `git commit`.
This will ask you for a commit message. The commit message may be one line,
but when one line isn't enough, enter a summary, followed by a blank line and
then multiple lines of description.

Each change you commit adds to the history of the branch you're working on.
When you execute a `git push`, you're sending all your changes on your current
branch to the origin repository.

Git is a huge topic unto itself and there is plenty of help available online.

## Fixing Bugs

Fixing bugs consists of

- Writing one or more tests which fail because of the bug
- Making the test(s) pass
- Performing a code change review
- Checking in the change

### Writing tests

Tests serve (at least) two purposes in Agile development:

- To define the scope of a change
- To detect regressions

Limiting the scope of changes helps to limit the programmer's natural tendency
to tinker. When the test passes, the change is done.

Bug regressions can easily occur as an unexpected side effect of seemingly
unrelated changes. Maintaining a test suite reduces the likelihood that such
regressions will go unnoticed and reach customers.

A good test is short and boring. Some programmers find writing tests to be "no
fun" because of this. Later they may grow to enjoy writing tests because
whether they pass or fail, the tests always work. It can be satisfying to know
that the five lines one added to the test suite are undeniably an improvement
to the project.

For the "how" part of writing tests, (as opposed to "what" and "why"), the
examples in the project _should_ be adequate. If not, that's on me.

Be wary of [Heisenbugs](https://en.wikipedia.org/wiki/Heisenbug): just because
a test fails once doesn't necessarily mean the test is sufficient, and just
because a test passes when you think it should fail doesn't mean the test
isn't useful. There is no trick to isolating such bugs.

The bug is probably due to a [race
condition](https://en.wikipedia.org/wiki/Race_condition). You may have to
force timing elements into your test to reliably trigger a bug.  It also may
not even be possible to trigger reliably. In that case it's acceptable to take
a probabilistic approach to reproducing the bug by, for example, looping
through the same test multiple times. This is less than ideal, but once you
discover the true nature of the bug you may find you can re-write the test(s)
to reproduce the bug reliably.

You may find that re-arranging the order of your tests increases or decreases
the frequency that certain tests pass or fail. It may be useful to seek the
ordering which causes the most tests to fail, but try to make sure that any test
which has ever failed with the current code continues to fail after
re-arranging the tests. If it is not possible to make all such tests fail
simply by re-ordering them, in which case you will probably want to add more
tests to ensure that all known failure conditions can be reproduced.

Don't change the code while you are changing tests! Commit (but don't push)
your changes to the tests before beginning to make code changes.

### Making tests pass

The goal is to get each test to pass by making the simplest possible change to
the code. It's a little like an application of [Occam's
Razor](https://en.wikipedia.org/wiki/Occam%27s_razor): if two changes both
make a test pass, prefer the simpler change. Secondarily, no other tests
should stop passing. Any tests that failed before making your change may
continue to fail, but if they also pass that's gravy.

### Code Review

(...)

### Checking in the change

(...)

## Adding features

Adding features is the same as fixing bugs except that the
bug is that the feature hasn't been implemented yet. That
is, the tests you write to demonstrate the bug should
demonstrate that the app doesn't have the feature.

## Refactoring

It sometimes happens that there is a need to 'refactor' the code. This refers
to multiple different code manipulations and their reversals.

(more to be added later, maybe)
