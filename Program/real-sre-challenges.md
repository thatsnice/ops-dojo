# Abstract version

## New "surprise" project with hard deadline and unknown requirements

Customer has an annual event which the SRE is expected to provide IT
support for.

  - Misc info
    - It's only a "surprise" in that the recurring event wasn't
      documented.
    - SRE was informed verbally of event's existence but not details
    - Customer expected SRE to already know what was needed
    - Customer brought previous SRE in to cover (perceived?) gap
    - Current SRE met with customer to negotiate details
      - Beyond expected information, got surprise job scope increase
      - SRE responded sub-optimally

  - Post-mortem
    - SRE onboarding can never be perfect, but a formal inventory of
      customer faces and needs might have helped.
    - SRE frustration a product of poorly negotiated boundaries?

  - Advice: minimize your demand on the customer
    - When it is necessary to request something of a customer, try to
      do as much of the ground work as possible.
    - If you can give them a single "yes/no" question, that is ideal.
      Try to put more complex questions in the form of "I guessed the
      following, but was unable to derive these other things:"
      followed by a series of questions which are as simple as you can
      make them. 
    - For example, if the project is a conference and attendees will
      need something from your team, guess based on your team's scope
      as to what sorts of things they will need. Make a list of that,
      then ask the customer "will attendees need anything from us that
      isn't already on this list?"
    - To extend that example, rather than asking "what is the greatest
      number of attendees you require support for", figure out how
      many you could support without significant resource impact and
      ask the question in the form of "will you need support for more
      than (minimum) people?"
    - For extra credit, figure out what the next higher level of
      people you can support is (resources needed, but risk low if
      those are provided) and if the answer to the first question is
      "yes", ask if it's more than THAT number.

## Backups

### Current stuff

- Problems
  - Inherited setup untested
  - Full backups showing signs of not working
  - SRE not familiar with backup tools
  - SRE not seeing a safe way to improve the situation
- Solutions
  - Locate or acquire unused host to experiment on
  - Safe backup/restore on unused host
    - Create test for health of unused host (checksum of config files or
      something?)
    - Back up unused host
    - Restore backup of unused host to unused host
    - Validate host
  - Attempt restore of production host to unused host
    - Identify or create health check for prod host
    - Restore prod backup to unused host
    - Apply health check to unused host
    - If indications are that backup is invali, treat production host
      as not backed up (image prod host drives, panic, etc).
  - Proceed from there
