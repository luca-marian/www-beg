#!/bin/bash

set -e

# Check if .ruby-version exists and use that, otherwise fallback to 3.2.2
if [[ -f .ruby-version ]]; then
  RUBY_VERSION=$(cat .ruby-version)
else
  RUBY_VERSION="3.2.2"
fi

echo "👉 Installing rbenv and ruby-build with Homebrew..."
brew install rbenv ruby-build

echo "✅ Setting up rbenv in your shell config..."
if ! grep -q 'rbenv init' ~/.zshrc; then
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc
  echo "🔁 Run: source ~/.zshrc (or restart terminal)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo "📦 Installing Ruby $RUBY_VERSION..."
rbenv install -s "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"

echo "💎 Ruby version now: $(ruby -v)"

echo "📦 Installing bundler..."
gem install bundler

echo "📌 Adding ARM64 platform to Gemfile.lock..."
bundle lock --add-platform aarch64-linux

echo "✅ Done! You can now run Docker without architecture errors."
