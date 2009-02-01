
#
# Testing Ruote (OpenWFEru)
#
# John Mettraux at openwfe.org
#
# Sun Jan 25 15:30:58 JST 2009
#

require File.dirname(__FILE__) + '/base'


class EftEqualsTest < Test::Unit::TestCase
  include FunctionalBase

  def test_0

    pdef = OpenWFE.process_definition :name => 'test' do
      sequence do
        equals :value => 'a', :other_value => 'a'
        _print '${f:__result__}'
      end
    end

    assert_trace(pdef, 'true')
  end

  def test_1

    pdef = OpenWFE.process_definition :name => 'test' do
      sequence do
        equals :value => 'a', :other_value => 'b'
        _print '${f:__result__}'
      end
    end

    assert_trace(pdef, 'false')
  end

  def test_2

    pdef = OpenWFE.process_definition :name => 'test' do
      sequence do

        set :variable => 'v0', :value => 'v'

        equals :variable_value => 'v0', :other_value => 'v'
        _print '${f:__result__}'

        equals :var_value => 'v0', :other_value => 'v'
        _print '${f:__result__}'

        equals :variable => 'v0', :other_value => 'v'
        _print '${f:__result__}'

        equals :var => 'v0', :other_value => 'v'
        _print '${f:__result__}'

        equals :v => 'v0', :val => 'v'
        _print '${f:__result__}'
      end
    end

    assert_trace(
      pdef,
      ([ 'true' ] * 5).join("\n"))
  end

  def test_3

    pdef = OpenWFE.process_definition :name => 'test' do
      sequence do

        set :field => 'f0', :value => 'val0'

        equals :field_value => 'f0', :other_value => 'val0'
        _print '${f:__result__}'

        equals :f_value => 'f0', :other_value => 'val0'
        _print '${f:__result__}'

        equals :field => 'f0', :other_value => 'val0'
        _print '${f:__result__}'

        equals :field => 'f0', :value => 'val0'
        _print '${f:__result__}'

        equals :f => 'f0', :other_value => 'val0'
        _print '${f:__result__}'
      end
    end

    assert_trace(
      pdef,
      ([ 'true' ] * 5).join("\n"))
  end
end

