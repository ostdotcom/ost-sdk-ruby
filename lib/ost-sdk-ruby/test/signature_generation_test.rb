require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class SignatureGenerationTest < Test::Unit::TestCase

  def signature_test_obj
    params = {api_secret: "35f346e5ef825ed4499da98a6ac6b401"}
    @signature_test_obj ||= OSTSdk::Util::HTTPHelper.new(params)
  end

  def test_signature
    test_obj_for_signature = {
        k1: 'Rachin',
        k2: 'tejas',
        list2: [
            {a: 'L21A', b: 'L21B'},
            {a: 'L22A', b: 'L22B'},
            {a: 'L23A', b: 'L23B'}
        ],
        make_mistakes: "",
        nice_param: [],
        empty_obj: {},
        empty_str: '',
        garbage_str: "~^[]%$#@!&*~,./?~()-_'this is garbage",
        id: 11003,
        email: 'mayur+67@ost.com'
    }
    test_endpoint = "/users"
    signature = signature_test_obj.get_signature_for_test(test_endpoint,test_obj_for_signature)
    assert_equal(signature, "ccd833cc3b1f191e9bfdbfdda92e1b4fd561ab6ef79ba04d31e2d85fc640b98e")
  end

end