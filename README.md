# README

This implements a simple Wiki with rich text documents and a basic title search facility

## Usage

`bin/rails s`

## Potential Improvements

* For multi-term and 'near' text search facilities, implementation depends on the backend database
  * SQLite - FTS5 (https://sqlite.org/fts5.html)
* Notice (Flash)
  * This could be turned into a component - see [Phlex](https://github.com/phlex-ruby/phlex-rails) which we're using already
* Trix (WYSIWGY editor)
  * make the bullets and indentation work (they do on their [example page](https://trix-editor.org/) )
* Automated testing
  * there is very little of this currently as it's a prototype but what there is does work
    * `bin/bundle exec rspec`
