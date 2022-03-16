module RubyDo
  class Api < Grape::API
    format :json
    prefix :api

    mount RubyDo::V1::Base
  end
end
