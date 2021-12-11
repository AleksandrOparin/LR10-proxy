# frozen_string_literal: true

require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get input in html format' do
    get proxy_input_url
    assert_response :success
    assert_equal 'text/html', @response.media_type
  end

  test 'should get output in html format on server side' do
    get "#{proxy_output_url}?&side=server"
    assert_response :success
    assert_equal 'text/html', @response.media_type
  end

  test 'should get output in xml format in browser' do
    get "#{proxy_output_url}?&side=client"
    assert_response :success
    assert_equal 'application/xml', @response.media_type
  end

  test 'should get output in xml format on client side' do
    get "#{proxy_output_url}?&side=client-with-xslt"
    assert_response :success
    assert_equal 'application/xml', @response.media_type
  end

  test 'should get different requests' do
    get "#{proxy_output_url}?InputNumber=100"
    first_response = @response.body.clone

    get "#{proxy_output_url}?InputNumber=121"
    second_response = @response.body.clone

    assert_not_equal first_response, second_response
  end

  test 'should get an error on request' do
    get "#{proxy_output_url}?InputNumber=-100"
    response = Hash.from_xml(@response.body.clone)
    assert_equal response['hash']['message'], 'Число меньше нуля (InputNumber = -100)'
  end
end
