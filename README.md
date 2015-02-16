Blocipedia is an app, hosted [here](ellen-Blocipedia.herokuapp.com), that allows users to create private and public wikis. Premium users may share the editing and updating of their private wikis with collaborators. 

The app incorporates a markdown parser, so that users may format their work; it also allows users to upload images to the Amazon s3 service using the [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) and [MiniMagick](https://github.com/minimagick/minimagick) gems, and to use them either as personal avatars or as additions to their wikis.

The [Devise](https://github.com/plataformatec/devise) and [Stripe](https://github.com/stripe/stripe-ruby) gems were used to create two levels of user, one free and one paid.