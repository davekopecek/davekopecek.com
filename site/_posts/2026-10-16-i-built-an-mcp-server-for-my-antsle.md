---
layout: post
title: "I Built an MCP Server for My antsle"
date: 2026-10-16 09:00:00 -0400
description: "Meet antsle-mcp, an unofficial MCP server for managing antlets and checking on an antsle through antMan's REST API."
category: articles
tags: [antsle, MCP]
image:
  feature: 2026-10-16-i-built-an-mcp-server-for-my-antsle-header.jpg
  alt: "An MCP connection between a terminal asking which antlets are running and a red antsle server"
---

Have you ever wanted to just ask your antsle what it's up to? I built a thing for that.

[antsle-mcp](https://github.com/davekopecek/antsle-mcp) is an unofficial MCP server that connects AI assistants such as Claude to antMan's REST API. Once it's set up, you can ask questions like:

- "Which antlets are running?"
- "Snapshot webserver before I break it."
- "How full is my zpool?"

MCP, or Model Context Protocol, gives an AI assistant a structured way to use tools and APIs instead of merely telling you which commands to run. In this case, it lets the assistant inspect your antsle and perform antMan operations conversationally.

It speaks standard MCP, so it should work with other MCP-capable assistants too. Claude Code is currently the easiest way to install it, but antsle-mcp isn't Claude-specific.

To be clear, this is a personal project, not an official antsle product. Please don't call antsle support if it misbehaves.

## What it can manage

antsle-mcp can:

- List, create, clone, start, stop, resize and delete antlets
- Create, restore and delete snapshots
- Browse and install templates
- Inspect vNICs, vDisks, vLANs, port forwards, load balancer rules and backups
- Check host status, including CPU, RAM, zpool usage and services

That covers the questions I tend to ask while working with an antsle without trying to turn the project into a conversational replacement for every button in antMan.

## Read-only means read-only

The Claude Code plugin starts in read-only mode. In that mode, write tools aren't registered at all. The assistant can inspect things, but the tempting buttons are not merely hidden behind a stern prompt. They aren't there.

The server also tells the assistant to inspect before changing anything, confirm antlet names before destructive actions, offer a snapshot before risky changes, and prefer a normal stop over a force-stop.

Host-level operations such as shutdown, antMan and edgeLinux upgrades, and network configuration commits have no dedicated tools. Those stay with a human in the antMan UI. There is an opt-in raw API tool for endpoints without dedicated tools, but the server explicitly tells clients not to use it for those host-level operations.

If you install by cloning the repository or running it directly with `npx`, set `ANTSLE_READ_ONLY=true` to get the same read-only protection. Those methods are writable by default, so this is not a fine-print detail.

## Install it in Claude Code

You'll need Node.js 22 or newer. Inside Claude Code, run:

```text
/plugin marketplace add davekopecek/antsle-mcp
/plugin install antsle-mcp@antsle-mcp
```

When you enable the plugin, Claude Code asks for your antsle URL, username, password and whether to use read-only mode. Read-only is on by default, and the password goes into your system's secure credential store.

You can also clone the repository and use a `.env` file, run it directly from GitHub with `npx`, or connect it to another stdio MCP client such as Claude Desktop. The [README](https://github.com/davekopecek/antsle-mcp#readme) has the commands and configuration details.

## Things to ask it

Read-only mode is enough for plenty of useful questions:

- "Which antlets are running, and how much RAM is each one using?"
- "Give me a health check of my antsle."
- "Show me the snapshots for my web antlet."
- "What templates can I install?"
- "What port forwards do I have set up?"

When you're ready to enable writes:

- "Snapshot my web antlet before I upgrade it."
- "Clone my test antlet so I can experiment on the copy."
- "Bump my database antlet to 8 GB of RAM."

## This is a prerelease

Version 0.1.0 is a prerelease, so expect some rough edges. It has been tested against antMan 3.4.4 and was built against antMan API 1.0.0. antsle describes that API as experimental, which is another way of saying that surprises may be included at no extra charge.

I'd especially like to hear:

- Whether it works with other antMan versions
- What's broken, confusing or missing
- What you'd like to ask your antsle that it can't answer yet

antsle-mcp is free and open source under GPL-3.0-or-later. You can find the code, installation instructions and issue tracker on [GitHub](https://github.com/davekopecek/antsle-mcp).

Have fun, and please snapshot before you experiment. With great power comes great responsibility. Or, to quote a guy who used to work for me: **"It works on my machine."** ¯\_(ツ)_/¯
