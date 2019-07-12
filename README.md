# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
Ruby 2.6

* System dependencies
Uses the qbwc gem

* Configuration

* Database creation
The usual Rails migration reside within this repository.  It uses Postgres, but all the database operations are standard.

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
This includes workers, as specified in the qbwc gem, to trigger the requests and responses from the QuickBooks Web Connector.

* Deployment instructions

* At this point, this would be generously classified as a work in progress.  For now, the hashes in the Worker, which get transformed in qbXML, are hard-coded, to aid debugging.
In addition, there is a chart of accounts worker, which adds one or more accounts to the chart in QuickBooks, then reads the result and adds those same accounts to a local chart of accounts table.
