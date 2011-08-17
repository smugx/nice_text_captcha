Nice Text Captcha
=================

by Neil Smith

About
-----

This generates text-based CATPCHAs that are "nice", by my own personal
subjective definition!

Questions are purposely simple, and examples would include:

* How many letters are there in the word 'White'?
* In the word "tiger", what is the letter in the 5th position?
* How many animals are in the words: "cat", 'Orange', and "dolphin"?
* What is 'four' + "nine"?

Why Another CAPTCHA Solution?
-----------------------------

There are plenty of choices out there, but none quite met my personal needs (or
some client's needs) for one reason or another:

* I wanted a self-contained solution that wasn't reliant on a 3rd party service
* Relatedly, I didn't want to have to muck around with API keys to get it working
* I wanted a few different question types, not just simple maths-based ones
* I didn't want long/odd words and case that make the question difficult to
  understand at first glance (so no "What's the first adverb in the list
	discombobulation, deFeNEStraTE, DiscOncErTinGly, DiSiNTEGRATing. Enter the
	name of a good Jack Black film if you don't think there are any adverbs. Enter
	a surprising fact about cheese if you don't think Jack Black has done any
	good films.")

Implementation
--------------

You call a method in your view which both generates a random question, and places
the possible answers into a flash[] object, stored in a SHA2 hash.

(It's stored in a flash, as Rails handles ageing the data after a request - if we
used the session, it would hang around for the duration of the session.)

Then, in your controller action, you call a method which extracts the answers from
the flash, and injects them into your model.

A validation method on the model finally checks the answer against the hashed
possible answers, and pushes an error onto the base of your model if the answer
doesn't match.

For numerical answers ("What is 'two' plus 'three'?"), both numbers ("3") and
words ("three") are accepted.

Requirements
------------

* Tested against Rails 2.3 - currently untested against Rails 3.
* 'linguistics' gem for turning numbers into words and ordinals (gem install linguistics)
* 'Digest/SHA2' for hashing the possible answers.

Installation
------------

Simply add:

    config.gem 'nice_text_captcha'

to your environment.rb file, and install the gem via your preferred method.

or for Rails 3, add the following line to your Gemfile:

    gem 'nice_text_captcha'

and run:

    bundle install

Usage Instructions
------------------

In your model, you need to add some validation:

    class Thing < ActiveRecord::Base
      validate :check_nice_text_captcha
    end

In your controller, you need to add a call to populate the answers from the
data in the session:

    class ThingsController < ActiveRecord::Base
      def create
        @thing = Thing.new(params[:thing]) # as normal
        validate_nice_text_captcha_for(@thing)
      end
    end

Finally, in your view, you need to render the question by calling nice_text_captcha,
and give the user a text box for their answer:

    <% form_for(@thing) do |f| %>
      <!-- normal form elements here -->
      
      <%= f.nice_text_captcha %> <!-- this will generate a label with the catcha text inside -->
      <%= f.text_field :nice_text_captcha %>
      
      <!-- probably a submit button here -->
      
    <% end %>
