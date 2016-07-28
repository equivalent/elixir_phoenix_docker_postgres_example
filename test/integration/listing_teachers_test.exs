defmodule ListingTeachersTest do
  use ExUnit.Case, async: true

  test 'listing teachers' do
    response = conn(:get, '/teacher')
    assert response.status == 200
  end
end
