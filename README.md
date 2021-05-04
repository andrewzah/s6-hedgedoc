## potential issues
### migrating versions
```
/data/hedgedoc/config$ ls -l
total 16
config.json
default.md
docs
uploads
views <--- why is this put in config? no clue.
```

This `views` folder may cause issues among different versions.
It did for me from `1.7.2`->`1.8.0` at least.
