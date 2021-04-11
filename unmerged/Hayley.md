topics
  - history of unix
  - networking
  - github
  - shell scripting
  - nodejs

networking

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



## Through time

### Manually copy document versions

- Doesn't scale at all; only for use by one person on a handful of files

```
$ cp doc.txt doc.txt.3
$ ls -1 doc.*
doc.txt
doc.txt.1
doc.txt.2
doc.txt.3
$ 
```

### RCS

- "Revision Control System"
- File history in ",v" database
- Scales to 3-4 people, tops

```
$ ci -u doc.txt
$ rcs -l doc.txt
...
$ ls -1
doc.txt
doc.txt,v
$
```

### CVS

- "Concurrent Version System"
- not the pharmacy
- Uses RCS internally
- Runs over the network
- Scales to small (up to 10) teams

### Subversion

- Early centralized distributed version control
- Scales to
  - thousands of well-behaved users
  - hundreds of poorly behaved users
  - large-ish projects (tens of thousands of files)

### Git

- Current world leader, may be the last VCS we ever need
- Scales to the largest projects currently in existance



----


- Local community investment
  - ask peers to honor healthier norms
  - Refuse to support platforms which....

- A lot of the US have lived in an echo chamber
  - FOX and friends

