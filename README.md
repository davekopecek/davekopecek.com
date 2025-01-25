## davekopecek.com

My personal blog. Created [Jekyll](https://jekyllrb.com/docs/pages/) using [Minimal Mistakes](http://mmistakes.github.io/minimal-mistakes) theme. All commands from WSL-Ubuntu shell.

### First Time Setup

To perform a clean installation on WSL-Ubuntu, follow these steps to remove existing Ruby installations and start fresh. This process will install rbenv for Ruby version management, which is required for Jekyll to work properly.

```bash
# 1. Remove existing Ruby installations
sudo apt remove --purge ruby-full ruby-bundler
sudo apt autoremove
rm -rf ~/.gem
rm -rf /usr/local/lib/ruby
rm -rf /var/lib/gems
rm -rf ~/.rbenv  # Remove rbenv if present
rm -rf ~/.rvm    # Remove RVM if present (we won't be using RVM)

# 2. Clean .bashrc of Ruby-related entries
# Remove any lines containing:
# - export GEM_HOME="$HOME/gems"
# - export PATH="$HOME/gems/bin:$PATH"
# - eval "$(rbenv init -)"

# 3. Install rbenv and dependencies
sudo apt update
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev

# 4. Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# 5. Set up rbenv in .bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# 6. Install Ruby 3.2.2 via rbenv
rbenv install 3.2.2
rbenv global 3.2.2

# 7. Install Jekyll and dependencies
gem update --system
gem install bundler
gem install jekyll
```

After installation, verify with:
```bash
ruby -v    # Should show Ruby 3.2.2
gem -v
bundler -v
jekyll -v
```

### Local Development

Using WSL, run with dev config on localhost:

```bash
bundle exec jekyll serve --config _config.yml,_config_dev.yml
```

Runs on http://127.0.0.1:4000

Note: The `_config_dev.yml` file contains development-specific settings that override the main config:
```yaml
# Development config overrides
url: "http://127.0.0.1:4000"   # Local development URL
```

Local startup, include posts in `_drafts` folder:

```bash
bundle exec jekyll serve --config _config.yml,_config_dev.yml --drafts
```

To stop all running Jekyll instances:
```bash
pkill -f jekyll
```

### Post Workflow

Octopress provides convenient commands for creating and managing posts:

```bash
# Create a new post
bundle exec octopress new post "My New Post Title"

# Create a new draft
bundle exec octopress new draft "My Draft Post"

# Publish a draft
bundle exec octopress publish _drafts/my-draft-post.md

# Unpublish a post (convert to draft)
bundle exec octopress unpublish _posts/2023-01-01-my-post.md
```

Posts will be created with proper naming and frontmatter:
```yaml
---
layout: post
title: "My New Post Title"
date: YYYY-MM-DD HH:MM:SS -0500
description: ""
category: articles
tags: []
image:
  feature: YYYY-MM-DD-post-title-header.jpg
---
```

* View @ http://127.0.0.1:4000/
* Edit post in your preferred editor
* Git add / commit / push / deploy as below

### Post Images

There are several ways to include images in your posts:

1. Basic Markdown syntax:
```markdown
![Alt text](/images/image-name.jpg)
```

2. With figure and caption:
```markdown
{% include figure image_path="/images/image-name.jpg" alt="Alt text" caption="Your caption here" %}
```

3. With alignment options:
```markdown
{% include figure image_path="/images/image-name.jpg" alt="Alt text" caption="Your caption here" align="center" %}
```

Alignment options:
- `align="left"`
- `align="center"`
- `align="right"`

Images should be placed in the `/site/images/` directory and referenced relative to the site root with `/images/`.

### Post Headers

Post header images should be:
- Sized to 1900px × 500px
- Placed in the `/site/images/` directory
- Named consistently (e.g., `YYYY-MM-DD-post-title-header.jpg`)
- Optimized for web delivery (JPEG format recommended)

Example frontmatter with header image:
```yaml
---
layout: post
title: "My New Post Title"
date: YYYY-MM-DD HH:MM:SS -0500
description: ""
category: articles
tags: []
image:
  feature: YYYY-MM-DD-post-title-header.jpg
---
```

Quick image resize using ImageMagick:
```bash
convert source-image.jpg -resize 1900x500^ -gravity center -extent 1900x500 YYYY-MM-DD-post-title-header.jpg
```

### Deploying

Rsync deploy to production from `sites` directory:

```bash
# This will build the site without _config_dev.yml on 127.0.0.1
bundle exec jekyll build
../scripts/deploy.sh
# Clear cloudflare cache
#../scipts/clearblogcache.sh
```

Optionally clear cloudflare cache: [Documented Here](http://www.davekopecek.com/cloudflare-command-line-cache-clear)

### Documentation
- [Jekyll Installation Guide](https://jekyllrb.com/docs/installation/ubuntu/)
- [Minimal Mistakes Theme Setup Guide](http://mmistakes.github.io/minimal-mistakes/theme-setup/)