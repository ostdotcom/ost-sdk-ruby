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
    assert_equal(signature, "22ad0a29668ad4b85604f828370d8cd12b6c925c35b27fb7b7f401379ee32a27")
  end

end