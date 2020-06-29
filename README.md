# basic_ruby


Run project using bundle to load the gems in Gemfile
```
$ bundle exec ruby tests/minitest.rb
$ bundle exec ruby main.rb
```

Install rbenv
```
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
$ export PATH="$HOME/.rbenv/bin:$PATH"
```

Install ruby 2.6.2 and set as default
```
$ rbenv install 2.6.2
$ rbenv global 2.6.2
```

Using Ruby2d
```
require 'ruby2d'


set title: "Hello Triangle"

Triangle.new(
  x1: 320, y1:  50,
  x2: 540, y2: 430,
  x3: 100, y3: 430,
  color: ['red', 'green', 'blue']
)

show
```
![alt text](https://github.com/cesar-rayo/basic_ruby/blob/master/images/triangle.png)