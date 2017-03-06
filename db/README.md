
## Sequel Bin


``` bash
$ sequel -E -m db/migrations/ mock://postgres
$ sequel -E -m db/migrations/ mock://sqlite

$ sequel -E -m db/migrations/ sqlite://db/production.sqlite

# dump schema:
$ sequel -d sqlite://db/production.sqlite
```
## Timestamps for Created and Updated

* [Sequel Timestamps](http://sequel.jeremyevans.net/rdoc-plugins/classes/Sequel/Plugins/Timestamps.html)


## Models

* [Model Validation](http://sequel.jeremyevans.net/rdoc/files/doc/validations_rdoc.html)





## Links

* [Sequel Cheatsheet](http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html)

--
* [Bin Sequel Doc](https://github.com/jeremyevans/sequel/blob/master/doc/bin_sequel.rdoc)

--

* [Sequel Migration Doc](https://github.com/jeremyevans/sequel/blob/master/doc/migration.rdoc)
* [Same but different Migration Doc](http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html)

--

* [Usage of sequel (ramaze)](https://github.com/Ramaze/ramaze/wiki/Setting-up-sequel-sqlite3)