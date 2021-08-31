argv = (require 'process').argv[2..]

without = (idx, letters) ->
  if idx
    [letters[0]].concat without (idx - 1), letters[1..]
  else
    letters[1..]

module.exports = { without, argv }
