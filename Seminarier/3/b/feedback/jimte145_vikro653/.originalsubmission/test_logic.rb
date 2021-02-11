
require 'test/unit'
require './logicparse.rb'

class TestLogic < Test::Unit::TestCase
  
  def test_and_false_false
    io = StringIO.new "(and false false)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"),"(and false false) should give false")
    
    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end 

  def test_and_false_true
    io = StringIO.new "(and false true)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"), "(and false true) should give false")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end
  
  def test_and_true_false
    io = StringIO.new "(and true false)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"), "(and true false) should give false")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end
  
  def test_and_true_true
    io = StringIO.new "(and true true)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"), "(and true true) should give true")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end
  
  def test_or_false_false
    io = StringIO.new "(or false false)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"), "(or false false) should give false")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_or_false_true
    io = StringIO.new "(or false true)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"),"(or false true) should give true")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_or_true_false
    io = StringIO.new "(or true false)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"), "(or true false) should give true")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_or_true_true
    io = StringIO.new "(or true true)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"),"(or true true) should give true")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end
  
  def test_not_false
    io = StringIO.new "(not false)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"),"(not false) should give true")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_not_true
    io = StringIO.new "(not true)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"),"(not true) should give false")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_variable_assignment_false
    io = StringIO.new "(set v false)\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"),"assignment to false is faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_variable_assignment_true
    io = StringIO.new "(set v true)\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"),"assignment to true is faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_variable_reassignment_to_false
    io = StringIO.new "(set v true)\n(set v false)\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"), "reassignment to false is faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_variable_reassignment_to_true
    io = StringIO.new "(set v false)\n(set v true)\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"), "reassignment to true is faulty")
    
    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
    
  end

  def test_assignment_to_expression
    io = StringIO.new "(set v (and true true))\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"), "assignment to expression is faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_reassignment_to_expression
    io = StringIO.new "(set v false)\n(set v (and true true))\n$v"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("true"), "reassignment to expression is faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end

  def test_calculation_using_variables
    io = StringIO.new "(set a true)\n(set b false)\n(and $a $b)"
    out = StringIO.new
    $stdout = out
    Logic.new.count io
    answer = out.string.split("\n")[-2]
    assert(answer.include?("false"), "calculation with variables faulty")

    assert( !(answer.include?("false") and answer.include?("true")) , "ambiguous response given:\n#{answer}")
  end
  
end
