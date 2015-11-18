---
title: FAQ
permalink: /faq/
---

#### Can I install Gitolite and Redmine on different servers ?
***

Yes. Redmine and Gitolite can be installed on different servers but you will need to store repositories on a network filesystem like NFS and configure servers to keep Redmine user's id and Gitolite user's id consistent accross servers to keep sudo working.


#### Why can't I specify a repository identifier that is the same as the project identifier?
***

A long time ago, in a galaxy far far away, The Empire (Redmine core team) was only accepting one repository per project. At that time the repository identifier was the project's identifier. Everything was fine until the rebells (Redmine community) came around and ask to the Jedis brotherhood (Redmine developpers) to add the possibility to have many repositories per project. Thanks to the Force this could be done and then appears multi repositories in Redmine but with one condition : repository will have an identifier to recognize them among the others... except for one repository. The Architect introduces one subtility : one repository per project can have empty identifier. It is called The One ;)


#### In the SCM list, Gitolite shows up as Xitolite
***

It's normal. It's the Ruby class name for Gitolite repositories. I would have named it Gitolite but there is a class name conflict with the Gitolite gem we use to access to Gitolite Admin repository. So it's a small workaround but it worth it ;)