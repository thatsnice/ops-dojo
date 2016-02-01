# Information Technology - How Do?

## Definitions

### Information Technology (IT)

IT is a blanket term referring to all the hardware, software, standards,
protocols, processes and procedures humans use to increase our communication
and data manipulation powers. The first printing press would qualify as IT,
though it may not have been widely recognized as such at the time.

### System

A System is a collection of devices, infrastructure, software and Sub-Systems.
A Sub-System is just a system which is part of a larger System.

### Infrastructure

There's nothing surprising about Infrastructure: it's the underlying stuff
that every System has in common. Examples include but are not limited to:

* Physical space housing equipment
 * Racks
 * Cabling (power, network, console)
 * Power systems (battery backup, transfer switches)
 * HVAC (Heating, Ventilation and Air Conditioning)
 * Physical security (Lenel access control)
* Network connectivity 
 * Peering
 * Routers
 * Firewalls
 * Switches
* Low-level system services
 * NTP
 * DNS
 * DHCP
 * Out-of-band management ('lights out')
* High-level system services (Infrastructure Automation)
 * Fleet management
  * Host build automation
  * Inventory
  * Host re-configuration
 * Network management
 * Monitoring/Alerting

### Operations

Operations refers to both the organizational entities who manage a system and
the activities they perform. Building a datacenter is Infrastructure work.
Maintaining the datacenter is Operations work.

## Objectives

Like anything in life, nothing in IT happens without some kind of motivation.
As I am well steeped in Amazon culture, I will refer to this motivation as
Customer Obsession and describe everything in those terms.

Measuring the success of a given IT System requires a sufficient understanding
of who The Customer is and what problem(s) of theirs The System solves. There
isn't a whole lot more that can be usefully said in the abstract so now we
look at some examples.

### Home Office

Our first example is a single person running their own company out of their
home. They provide consultation services of some sort (finance, relationship,
decorative, etc). They need a web site to act as a kind of storefront for the
services they provide. Their website needs to facilitate communication with
customers and it needs to be an attractive resource to customers.

### Generic small ISP

(So much for keeping it simple...)

Got.net is an Internet Service Provider in Santa Cruz, CA. It was founded some
time around 1993-1994 and has a lot of history. I don't know what state
Got.net is in since I stopped working there in 2002, so for this example I
will describe a hypothetical ISP modeled after what Got.net was like around
\1999. I will call this non-existant ISP "not.net". This has nothing to do
with the actually 'not.net'. The technology I describe will be out-dated, but
the concepts are not.

Not.net has two classes of customers: Internet connectivity and web
hosting. Internet connectivity customers need a way to connect their homes or
offices to the Internet. Web hosting customers need a way to publish static
and dynamic content to the Internet without running services out of their
homes or offices.

Web hosting customers want a permenent presence on the Internet but they don't
want to manage the servers hosting the media which comprises that presence.
A classic use case is someone with a home business they run by themselves.
They want their current and prospective customers to be able to find them via
Google. They want to provide said customers with contact options, information
about the services they provide and perhaps some articles on the subject of
their trade which might attract customers looking for information contained
in those articles.

Both kinds of customers have additional service needs:

* Tech support
* Email hosting and spam filtering
* DNS hosting

## Serving These Customers

#### How dial-up works

Connectivity customers connect via a dial-up connection. Customers have an
analog modem connected to a POTS (Plain Old Telephone Service) line which they
might also use for voice calls. The number they dial to connect is associated
with a 'hunt group' managed by the ILEC (Incumbent Local Exchange Carrier, aka
'the telephone company'). When a customer dials the not.net dial-up number,
the telephone system 'hunts' through the actualy telephone numbers in the hunt
group and connects the caller with the first one it finds which isn't already
in use. Not.net has one phone number pointing at 120 phone numbers. Each of
those 120 phone numbers has 'copper pair' associated with it which is (in a
round-about way) connected to a physical modem. Each modem has a serial cable
connecting it to a so-called serial-concentrator. There are four serial
concentrators ...

