# Lyft Practice 

You're building an app in the style of Lyft/Uber

A lot of starter code has been filled out already, and there are RSpec tests for
all of the deliverables listed. In order to mimic the way you'll be working
during a code challenge, I encourage you to use the console to test your methods
as you would in a code challenge environment. After you have your method written
and you feel it is passing, then run the tests to confirm.

## Using the console

You can use the console with `ruby tools/console.rb`. Inspect this file to find
instances of each class instantiated with proper relationships. You may use
these to test your own methods, or create your own instances as well.

## Running the specs

You can run the specs with `rspec`. RSpec comes with a lot of different options.
You may know of the `--fail-fast` or `--f-f` option which allows you to only see
one failing test at a time. In addition, there is a `--example` or `-e` flag,
which allows you to supply a string that is used to only run tests that contain
the supplied substring within their description block. For example, if we have a
test written as such: 
```
it "runs this test with the example flag" do
	expect(true).to be(true)
end
```
In addition to not being a particularly helpful test, we can target *only* this
test with the command `rspec -e runs. We can also replace the word "runs" with
any string contained in the first line of the test. This is very useful for only
running specific tests.