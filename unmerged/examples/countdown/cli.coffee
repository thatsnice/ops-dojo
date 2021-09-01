#!/usr/bin/env coffee

{ stdin
  stdout
}         = require 'process'
readline  = require 'readline'

more = 0

{findWords, dictionaryName} = require './anagrams'
{numberSolution}            = require './numbers'

dictionaryName './words'

JUMBLE =
  ///
    ^ ( [a-zA-Z]+ )
      \s+
      ( (?:\d+)
        (\s+ \d+)*
      )
    $
  ///

main = ->
  rl = readline.createInterface input: stdin, output: stdout
  rl.setPrompt '> '
  rl.prompt()

  rl.on 'line', (line) ->
    line = line.trim()

    switch
      when not line.length
        console.log ''
      when m = line.match /^\s*(help|\?)/
        showHelp()
      when m = line.match /^\s*more\s+(\d+)/
        more = Number m[1]
      when (numbers = line.match /[0-9]+/g) and numbers.length is 7
        [goal, numbers...] = numbers
        console.log numberSolution goal, numbers
      when jumble = line.match JUMBLE
        [ , letters, lengths] = jumble
        lengths = lengths
          .split /\s+/
          .map (n) -> parseInt n
        console.log jumbleSolutions letters, lengths

      else
        letters = line
          .toLowerCase()
          .match /[a-z]/g

        console.log findWords(letters, more).join '\n'

    rl.prompt()


showHelp = ->
  console.log '''
    Lines of just letters are letter queries.
    Lines of just numbers separated by spaces are number queries like:
      567 100 50 9 1 3 7

    'more n' shows words of length (max - n)
    '?' and 'help' show this message.
  '''


byLength = (buckets, word) ->
  (buckets[word.length] ?= []).push word
  buckets


jumbleSolutions = (letters, lengths) ->
  words =
    findWords letters, letters.length
      .filter (w) -> w.length in lengths
      .reduce byLength, []

  solutions = []

main()
