topics
  - history of unix
  - networking
  - VCS
  - shell scripting
  - nodejs

# networking

- The Joe Spect question
  - DNS
    - UDP
  - HTTP
    - TCP
  - HTTPS
    - TLS

- Physical
  - Ethernet
  - WiFi

Security
 - How to talk about security: Alice, Bob, Charlie, Eve, Malory, Trent

 - Pillars
  - Authenticity    : who am I really talking with?
  - Avilability     : how reliable is this service?
  - Confidentiality : who all can see what I'm doing?
  - Integrity       : will 1 always equal 1?
  - Non-repudiation : can I prove the server sent me a message?

 - Encryption
  - Symetric crypto
  - Asymetric crypto
  - Public key crypto
   - One-way function
   - Pub/priv key pairs
   - signing vs encrypting

 - TLS
  - session key exchange


# Version Control Systems (VCS)

## Problem description

Users need a way to manage changes to multiple related files.

- Any number of users are editing any number of files through their lives
- It needs to be easy to
 - view a history of a file or set of files
 - record changes with notes describing the changes
 - reverse changes

- It would be nice for users to be able to
 - operate on the same file at the same time
 - smoothly merge simultaneous changes from multiple editors
  - This is a Hard problem with a capital 'H'

How this fits into the five pillars of security (because everything does):

- Integrity: all changes accounted for and reversible
- Availability: a good VCS never gets in the way of users' edits

## Through time

### Manually copy document versions

```
$ cp doc.txt doc.txt.3
$ edit doc.txt
$ ls -1 doc.*
doc.txt
doc.txt.1
doc.txt.2
doc.txt.3
$ diff doc.txt.3 doc.txt
--- doc.txt.3   2021-04-11 15:41:02.000000000 -0700
+++ doc.txt     2021-04-11 15:41:10.000000000 -0700
@@ -1,2 +1,3 @@
 Hello world!
 It's such a CRAP DAY.
+Goodbye cruel world!
$ 
```

This is the obvious quick-and-dirty approach. When the user isn't sure of her
change she saves a backup under a different name. This doesn't scale at all.
As soon as there are multiple files, multiple users or complicated edit
histories the system creates almost as many problems as it solves. It also
doesn't provide change annotation.

### RCS

- "Revision Control System"
- File history in ",v" database
- Scales to 10 people, tops

```
$ co -l doc.txt
doc.txt,v  -->  doc.txt
revision 1.3 (locked)
done
$ edit doc.txt
$ rcs diff -u doc.txt
CS file: doc.txt,v
retrieving revision 1.3
diff -u -r1.3 doc.txt
--- doc.txt     2021/04/11 22:49:33     1.3
+++ doc.txt     2021/04/11 22:41:10
@@ -1,2 +1,3 @@
 Hello world!
 It's such a CRAP DAY.
+Goodbye cruel world!
$ ci doc.txt
$ ls -1
doc.txt,v
$
$ rcs log doc.txt

RCS file: doc.txt,v
Working file: doc.txt
head: 1.4
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 4;     selected revisions: 4
description:
Sample version-controlled file
----------------------------
revision 1.4
date: 2021/04/11 22:51:24;  author: robert;  state: Exp;  lines: +1 -0
I don't want to live on this planet anymore
----------------------------
revision 1.3
date: 2021/04/11 22:49:33;  author: robert;  state: Exp;  lines: +1 -1
The day turned crap
----------------------------
revision 1.2
date: 2021/04/11 22:48:10;  author: robert;  state: Exp;  lines: +1 -0
It was a good day
----------------------------
revision 1.1
date: 2021/04/11 22:44:28;  author: robert;  state: Exp;
Initial revision
=============================================================================
```

### CVS

- "Concurrent Version System"
- not the pharmacy
- Actually just a front-end to RCS
- Early centralized distributed version control
- Scales to medium (up to 100) teams
- No example below as the differences aren't educational

### Subversion

- Explicitly intended to replace CVS
- Scales to
  - thousands of well-behaved users
  - hundreds of poorly behaved users
  - large-ish projects (tens of thousands of files)

### Others

- Mercurial: for people who find Subversion insufficiently performant
- Perforce: for people who like to pay a lot for old ideas
- BitKeeper: designed by Linus Torvalds and Larry McVoy
 - They got into a fight, so Linus took his ball and went home
 - Seems to be an abandoned project now

### Git

- Designed and implemented by Linus Torvalds
- Current world leader, may be the last VCS we ever need
- Scales to the largest projects currently in existance

```
$ edit doc.txt
$ git diff
diff --git a/doc.txt b/doc.txt
index becd321..1bf1fe1 100644
--- a/doc.txt
+++ b/doc.txt
@@ -1,2 +1,3 @@
 Hello world!
 It's such a CRAP DAY.
+Goodbye cruel world!
$ git commit -a -m"I don't want to live on this planet anymore"
[master f1a0a48] I don't want to live on this planet anymore
 1 file changed, 1 insertion(+)
$
```

### GitHub

[GitHub](https://en.wikipedia.org/wiki/GitHub), now owned by Microsoft, has
hosted hundreds of thousands of community projects...
