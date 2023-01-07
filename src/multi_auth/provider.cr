abstract class MultiAuth::Provider
  getter redirect_uri : String
  getter key : String
  getter secret : String

  abstract def authorize_uri(scope = nil, state = nil, &block : URI::Params::Builder ->) : String

  def authorize_uri(scope = nil, state = nil) : String
    authorize_uri(scope, state) { }
  end

  abstract def user(params : Hash(String, String), code_verifier : String? = nil) : User

  def initialize(@redirect_uri : String, @key : String, @secret : String)
  end
end
