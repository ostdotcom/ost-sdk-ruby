require_relative "../../../lib/ost-sdk-ruby/util"
require_relative "../../../lib/ost-sdk-ruby/saas"
require "test/unit"
require_relative "../../../lib/config"

class SignatureGenerationTest < Test::Unit::TestCase

  def signature_test_obj
    params = {
        api_secret: "a0431203671f42c079b2154066fd04ba"
    }
    @signature_test_obj ||= OSTSdk::Util::HTTPHelper.new(params)
  end

  def test_signature
    test_obj_for_signature = {
        a: nil,
        b: [],
        c: '',
        d: ["", nil],
        e: {},
        k1: 125.45,
        k2: 'Tejas',
        aaaaa: {a: {a: "L21A", b: "L21B"}, b: {a: "L22A", b: "L22B"}, c: {a: "L23A", b: "L23B"}},
        arrayValues: ["Hello", "There", "12345"],
        garbage_str: "~!@#$%^&*()_+-= {}[]:\";'?/<>,. this is garbage"
    }
    test_endpoint = "/api/v2/users"
    signature = signature_test_obj.get_signature_for_test(test_endpoint, test_obj_for_signature)
    assert_equal(signature, "28664cdbc613b66835d7bcf825dce719fb8e0621992c291ba9bd1767c1c5560d")
  end

end