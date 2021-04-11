# Unrelated takeaways

## On Unix culture

- Old vs New commands
 - Old commands
  - unnecessarily terse
   - Often they didn't even tell you when your request succeeded
   - Favored machine-friendly patterns
    - single letter switches
    - unweildy data encapsulation
 
 - New commands
  - avoid polluting the namespace by claiming a short prefix
   - `cvs`, `svn`, `hg`, `pf`, `git`
   - Favoring human-friendly patterns
    - --long-switches
    - JSON and YAML
 
- Successful tools have ALWAYS been scripting friendly
 - GUIs created as wrappers around command-line tools
 - Input and output carefully quoted

- Jokes welcome

# On Quoting

Quoting is a problem which has plagued thinkers for ages.
- [Use-mention distinction](https://en.wikipedia.org/wiki/Use%E2%80%93mention_distinction)
- [Gödel, Escher, Bach](https://en.wikipedia.org/wiki/G%C3%B6del,_Escher,_Bach)

In protocols, use/mention confusion is a huge source of problems
- [SQL injection](https://en.wikipedia.org/wiki/SQL_injection)
- [Little Bobbie Tables](https://xkcd.com/327/)

Being scripting-friendly includes employing protocols which avoid these
problems.

- Data encapsulation from least to most human-friendly (also from most to least successful, at least until recently):
  - [XML](https://en.wikipedia.org/wiki/XML)
  - [JSON](https://en.wikipedia.org/wiki/JSON)
  - [YAML](https://en.wikipedia.org/wiki/YAML)

