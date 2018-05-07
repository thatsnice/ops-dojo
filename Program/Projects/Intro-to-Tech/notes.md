# Concerns

- There's a lot of material to cover. How to keep it interesting and coherent?
- Practical exercises
  - use it or lose it
  - Exercises have to be
    - fun and/or relevant
    - short
    - challenging/engaging but not frustrating

# To-do

## Kellie

- Get her a way to tinker on her terms
 - Sharing Mianna's laptop won't work
 - Maybe recussitate my Yoga 3?
 - Maybe give her my machine and get myself a new laptop?
  - too generous?

## Mianna

- Re-assess interest

## Either or both

- Present the landscape
 - History, motivation
  - "by humans, for humans"
  - sources of complexity
   - greed, stupidity
   - mistakes
   - new information

 - Contexts/Domains
  - Meta: talking about the lessons, learning, etc
  - Non-technical/tangential
   - Project/program management
  - Abstract
   - Math
   - Protocols
   - Design patterns
   - The seven-layer-burrito
  - Concrete Layers and Their Protocols
   - Program and library layouts
   - Package systems
   - Human interfaces (WIMP, emoji, Vim, ...)
   - Network layers

# Domains, their layers and examples

## Network

- Physical (wires, circuits)
- Data (signals, Ethernet)
- Network (IP)
- Transport (TCP)
- Session (examples are poor, maybe talk about cookies)
- Presentation (ASCII, HTML, telnet?, ...)
- Application (HTTP, XMPP, ...)

## Programming

- machine code
- assembly
- C, Lisp, Forth
- C++
- Java, C#
- Perl, JavaScript, Ruby, Haskel

## System

- Hardware
 - Bridges
 - RAM, Busses
 - Peripheral Controllers
 - Peropheral Devices
- Firmware
 - Microcode
 - Boot PROM
 - Controller firmware
- Operating System
- Libraries
- Services
- Programs with UIs

## Security

- Aspects
 - Authenticity (it is the system you think it is)
 - Availability (it is usable for its advertised purpose)
 - Integrity    (it behaves correctly)
 - Privacy      (it doesn't leak data)

- Physical security
- Network security and it many layers
- Application security
- Human factors

# Operations

## Puzzle pieces

- People/groups
 - Customers
 - Vendors
 - Engineers

- Software/services
- Devices
- Network transports
- Physical and logical network topologies
- Access control (authn/authz)

## System Life-cycle

- Commissioning
 - Requirements
 - Design
 - Policies
  - SLAs
  - Change control
  - ...

 - Implementation
  - Project Management/Logistics
  - Automation
  - Measurement, logging
  - Alerting
   - Automated responses
   - Manual responses
  - Deploying and connecting pieces
   - Should be handled by automation after bootstrapping

- Operations, maintenance
 - Onboarding/offboarding customers
 - Should be handled by alerting/automation:
  - Scaling
  - Patching
 - Adapting to
  - changes
   - Technology
   - Environment
   - Requirements
   - Other new information
  - Understanding the change
  - Implementing the fix(es)

- Decomissioning
 - Always have an exit plan
 - Offboarding remaining customers
 - Reverse commissioning process
 - Secure destruction of data
 - Hardware recycling

