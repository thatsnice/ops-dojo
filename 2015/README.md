# TIC

Talk is Cheap: Manage your hosts, network, datacenter or organization with a chat client.

# Wait, "talk is cheap" ... in a good or bad way?

Why so judgemental? Yes, the phrase has multiple interpretations, and they are
all relevant to understanding the TIC project:

## Chat protocols are inexpensive

The eXtensible Messaging and Presence Protocol (XMPP), formerly known as
Jabber, is a well-defined, stable, extensible, widely supported protocol for
reliable delivery of messages. There are dozens of messaging protocols to
which these adjectives apply, but XMPP is both old and has an active community
which is a good combination.

Building a system management suite on a protocol like XMPP is cheaper than
re-inventing the wheel. It "automatically" provides reasonable default
solutions for access control, reliable communications, logging and many other
problems which an ambitious management system faces.

TIC seeks to decouple all of its dependencies, so hypothetically a valid TIC
installation could replace XMPP with another messaging protocol or could even
provide all of the features of a messaging protocol with a collection of
ligher-weight services.

Still, before it even had a name, TIC was inspired by a proposal made by Paul
Ruiz at what was then known as The Disney Internet Group (DIG). Paul's
proposal was something like "someone should make a system management tool
based on Jabber so you can log in to your chat client, send control messages
to the change management system, receive alerts via IM, get inventory
information from a the configuration database agent, etc." 

(This was over ten years ago, and we haven't looked up Paul to see what he
wants us to say about this. Our memory may be off but we want to try to give
credit where it is due.

## It is less expensive to make a promise than to fulfill it

The phrase "Talk Is Cheap" is most often used as a way to express skepticism
that a promise will be fulfilled. For every successful ambitious project
(Unix, Google search, AWS) there are millions of proposals expressed which
never went beyond the walls of the room they were offered in.

By naming the project Talk Is Cheap we acknowledge that risk and endeavor both
to deliver on the promises we are making and to lower the cost of delivery for
others out there with their own ambitious ideas. The easier it is to get from
"wouldn't it be neat if" to "check out what I made", the better off we all
are.

## Ensuring clear communication costs less than taking it for granted

Habits, patterns and tools which ensure clear, accurate, precise
communication between collaborators have overhead. At their worst these
elements form the worst kinds of bureaucracies. Even at their best, there is
always a point at which further structure and clarification is not justified.
In our experience, humans are more likely to err on the side of
under-communicating.

In this sense "Talk Is Cheap" refers to the cost difference between a little
more clarity now compared to the potentially much larger cost of a
misunderstanding uncovered later.

## The cost of shared information becomes vanishingly small

While the up-front cost of information can be astronomically high, copying
that information is funtionally free. Amortizing the cost of the information
across all its uses, the cost of widely shared information approaches zero
rather quickly.

The TIC project therefore values consensual sharing of any information of
value to others which does not compromise security, privacy or otherwise
impinge on individual liberty or human rights.

In other words, "Talk Is Cheap" is another way of saying "Open Culture
benefits everyone."

# That sure is a lot of talk, but I still don't know what TIC really is

## A system management tool set

TIC is a means of simplifying the complexity common to most collections of
hardware and software employed to solve human problems. If you are running
more than one service on more than one host and you need it to keep working
when you're not watching it, TIC can probably help. Whether it is worth the
effort or not will depend on your own preferences and requirements.

As your demands increase in complexity because you add services, hosts,
locations and humans, TIC becomes increasingly helpful. TIC provides sane
defaults and a manageable override system to minimize what you have to tell
TIC and maximize the utility of what you tell it.

### That sounds like a lot of puffery. Can you give me an example?

Yes, but first let's paint a picture of the problem space:

#### The Problem

Alice is a Site Reliability Engineer for a small office. She has been asked to
set up the latest version of the [Horde](http://horde.org) productivity suite.

  - It is considered "available" during every clock minute in which it
    responds to 99% of user requests "normally" within 100ms.
  - It may be down during work hours for up to 30 minutes a week.
  - It needs to lose no more than an hour of work and take no longer than one
    business day to return to service in the event of a catastrophe.
  - It must be "easy" for a qualified future SRE to maintain.

We'll hand-wave the details and other requirements, but it's worth pointing
out that, depending on how deeply Alice wishes to go into TIC (allusion
intended), it could even help her negotiate these kinds of requirements with
her customers.

To satisfy these requirements without any kind of system management tools,
Alice will have to manually:

  - Document for her successors
    - the what, how and when of how she's going to build the system
    - the care and feeding of the built system
    - what cleanup will need to be done when the system is retired

  - Perform the actual setup
    - Setup an operating system on her new servers
    - Setup monitoring and alerting to help minimize downtime
    - Setup metrics and reporting to demonstrate continuing

  - Care for and feed the system
    - Respond to alerts
    - Adapt the system to surprises
    - Add capacity to the system before the capacity is needed

There are tools available now which help with a lot of this, but as far as we
know there is no Open Source tool set which addresses all of the complexity in
this scenario, and that's without adding a new requirement:

Alice's customer hired Bob to manage their web site. Bob doesn't like PHP and
will not tolerate the limitations imposed on his work by the Horde framework.
He needs the ability to develop NodeJS and Ruby on Rails services and
applications. He requires continuous deployment and full-cycle testing. Worst
of all, none of what he requires is unreasonable.

To keep her life simple, Alice prefers to give Bob as little access to the
systems she maintains as possible, but she also doesn't want to do Bob's job
for him. Without tools to help, Alice will have to find or build the
components which will support Bob's requirements (source control, test
management, release management, change management, configuration management,
...), document and deploy these systems.

#### Non-TIC solutions

There are network management tools available [citation needed] to provide
simplified configuration and monitoring of network gear and servers. If Alice
built her system in AWS she could use

 - AWS CloudFormation to build up and tear down services
 - AWS Elastic BeanStalk to dynamicaly scale her system
 - AWS OpsWorks to install and configure software and keep monitoring up to date
 - AWS Service Catalog and AWS Config to address some of her other needs

There are other AWS services to aid Alice in her work, but they are not
tightly integrated, they don't provide automatic documentation and they are
all AWS-specific. 

If Alice decides AWS is over-kill she might have to implement the entire
system on a single beefy server in the customer's (temperature and humidity
controlled) warehouse. She will have to decide which available tools to use to
simplify her life and she will have to integrate them herself. 

Perhaps she will use Nagios for monitoring, Horde's own wiki app for free-form
documentation (after she has it up and running), Chef for host and service
deployment and configuration, etc. She will have to grow her own management
suite organically and if she ever does scale up to a size where more expensive
tools are justified, little of what she did will work well with whatever tools
she adopts.

#### The TIC solution

Alice already has TIC running on her laptop. It's not a demanding application
so there's no reason not to. While her customer is ordering lunch Alice opens
up a chat window with her local TIC instance:

    Alice: create customer WendleWidgets
    TIC-top: Done. WendleWidgets opened a chat session with you to request
    direction.
    Alice: alias customer WendleWidgets Wendle
    TIC-top: Done. You may now use 'Wendle' to mean 'WendleWidgets'

The new WendleWidgets customer has an identity within Alice's chat environment.
That identity sends her a message to inform her that it is ready to talk about
what she wants to do:

    WendleWidgets: Hi Alice. I'm the new customer you requested. 

    To interact with me through a browser, click
      https://localhost/customer/WendleWidgets

    WendleWidgets: What is my formal name?

    Alice: Wendle Widgets, Inc.

    WendleWidgets: How do you contact me?

    Alice: wendle@wendlewidgets.com and 206-555-1212

    WendleWidgets: I'm interpreting that as two contact methods:

        Email: "<wendle@ww.example.com>"
        Phone: "206-555-1212"

    WendleWidgets: That's it for minimal setup. Here's a summary:

        Name: "Wendle Widgets, Inc."
        Contact:
          Email: "<wendle@ww.example.com>"
          Phone: "206-555-1212"
        Reverse Contact:
          Name: "Alice's Super SRE Services"
          Email: "<alice@sre.example.com>"

    Alice: get url

    WendleWidgets: https://localhost/customer/WendleWidgets

    Alice: new requirement: groupware

    WendleWidgets: 'groupware' does not match an existing requirement, product
    or service.  I'll treat it as a wishlist item. 
    
    What does 'groupware' mean?

    Alice: probably horde.org stuff, but should look into other options

    WendleWidgets: Great. When you're ready to develop this item into a
    requirement, product or service, tell me or TIC-top to 'develop
    wishlist/groupware' or visit

        https://localhost/terms/wishlist/groupware

    Alice: add notes to wishlist/groupware

    WendleWidgets: I'll append what you send me to the notes for that. End the
    notes with "!done".

And then while the customer is talking about what they think they want Alice
can type her summary into her chat window and TIC will do what it said.
