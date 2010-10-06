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
* How many animals are in the words: "cat", "orange", and "dolphin"?
* What is 'four' + "nine"?

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

Tested against Rails 2.3 - currently untested against Rails 3.
'linguistics' gem for turning numbers into words and ordinals.
'Digest/SHA2' for hashing the possible answers.

Instructions
------------

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
      
      <%= f.nice_text_captcha %><br />
      <%= f.text_field :nice_text_captcha %><br />
      
      <!-- probably a submit button here -->
      
    <% end %>
