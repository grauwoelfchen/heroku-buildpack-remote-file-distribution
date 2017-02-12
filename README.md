# Heroku buildpack: Remote File Distribution

This buildpack distributes files from remote storage.

Currently following storage types are available:

* `s3://`, Amazon Simple Storage Service (S3)


## Setup

### Environment Variables

```zsh
: for s3://, rfd: remote file distribution
RFD_S3_ACCESS_KEY_ID=""
RFD_S3_ACCESS_KEY_SECRET=""
```


## Usage

0. Put `.remote-files`
1. Add this buildpack into `.buildpacks`
2. Set env variables via `heroku config` (e.g. `RFD_S3_ACCESS_KEY_ID` etc.)
3. Deploy

The files `.remote-files` and `.buildpacks` should be commited into VCS.

```zsh
% cat .remote-files
s3://xxx <app>/static/foo.txt
s3://zzz <app>/static/img/foo.html
s3://yyy <app>/templates/foo.html
```

```zsh
% cat .buildpacks
https://gitlab.com/grauwoelfchen/heroku-buildpack-remote-file-distribution#v0.1
...

% git push heroku release:master
...
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Multipack app detected
remote: =====> Downloading Buildpack: https://gitlab.com/grauwoelfchen/
heroku-buildpack-remote-file-distribution
remote: =====> Detected Framework: Remote File Distribution
...
```

## Test

Test run on docker image.  
This uses [heroku-buildpack-testrunner](
    https://github.com/heroku/heroku-buildpack-testrunner).

```zsh
% sh ./test/suite.sh

BUILDPACK: /app/buildpack
  TEST SUITE: compile_test.sh

  Ran 0 tests.

  OK
  0 SECONDS

  TEST SUITE: detect_test.sh
  testExitStatus
  testDetectedName

  Ran 2 tests.

  OK
  0 SECONDS

0 SECONDS

------
ALL OK
0 SECONDS
```


## Links

* [Buildpack API | Heroku Dev Center](
    https://devcenter.heroku.com/articles/buildpack-api)
* [heroku/heroku-buildpack-testrunner: Unit testing framework for
   Heroku buildpacks.](https://github.com/heroku/heroku-buildpack-testrunner).
* [Yasuhiro Asaka / heroku-buildpack-make · GitLab:](
    https://gitlab.com/grauwoelfchen/heroku-buildpack-make)
* [Yasuhiro Asaka / heroku-buildpack-gettext · GitLab:](
    https://gitlab.com/grauwoelfchen/heroku-buildpack-gettext)


## License

See `LICENSE`.

Copyright (c) 2017 Yasuhiro Asaka

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
