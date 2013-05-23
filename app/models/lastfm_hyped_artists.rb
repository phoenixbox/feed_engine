# class LastfmHypedArtists < FeedItem

#   def valid_attrs
#     %[name image percentagechange]
#   end

#   def self.get_hyped_artists
#     lastfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
#     token = lastfm.auth.get_token
#     # i want to go to that route and then get back the goods
#     last_fm_url = "http://www.last.fm/api/auth/?api_key=#{ENV["LASTFM_CONSUMER_KEY"]}&token=#{token}"
#     redirect_to last_fm_url  
#     lastfm.session = lastfm.auth.get_session(:token => token)['key']
#     # I dont have a user token
#     # Use a default admin token?
#   end

# end