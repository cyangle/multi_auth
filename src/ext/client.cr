class OAuth2::Client
  def get_access_token_using_authorization_code_with_pkce(authorization_code : String, code_verifier : String? = nil) : AccessToken
    get_access_token do |form|
      form.add("redirect_uri", @redirect_uri)
      form.add("grant_type", "authorization_code")
      form.add("code", authorization_code)
      form.add("code_verifier", code_verifier.not_nil!) unless code_verifier.nil?
    end
  end
end
