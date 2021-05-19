I espose the One True Brace Style (1TBS):

- Open braces at the ends of the lines which declare their blocks
- cuddled elses (`} else {`)
- Braces required even when the language doesn't require them

Additionally, I encourage conspirators to align identical items vertically:

```javascript
chalk = require 'chalk'

sys   = require './sys'

function example() {
  var name         = sys.defaultName(),
      rank         = sys.defaultRank(),
      serialNumber = sys.defaultSerialNumber();

  // ,,,
}
```

The standard argument against vertical alignment is that it adds noise to
diffs. To thi I say just turn off whitespace sensitivity and you should be
fine.

# vertical whitspace

I favor judicious use of vertical whitespace to separate/group related
statements:

```coffee
class NiceBehavior extends MonoBehavior
  ...

```
