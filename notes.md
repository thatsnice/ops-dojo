2016-02-02

- First big demo: deploy large-scale multi-app stack
  - Persistence, web apps, edge caching, DNS, ...
  - Everything monitored, alerting, graphing and documented
  - Everything driven by business goals provided during the demo
    - Everything automatically configured by implication 
    - (Nicole's point about group membership representing configuration)

- TIC
  - needs to be usable and intuitive
  - automatically generates impact reports
  - All internal and external information falls within the scope of the
    inventory database
    - One portion is solely managed by TIC

  - TIC inventory represents
    - Full list of every package, service, etc which is being actively diffed
      across the environment. What an instance requires and where in the
      system those requirements are not met.

- Nicole is wary of over-simplification and unified solutions which do not
  account for all relevant context
