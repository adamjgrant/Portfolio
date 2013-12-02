###
@fileoverview
Defines core functions used throughout the Scalyr javascript
code base.  This file is included on every page.

@author Steven Czerwinski <czerwin@scalyr.com>
###

###
@param {Object} value The value to check
@returns {Boolean} True if value is an Array
###
k$.isArray = (value) ->
  Object::toString.call(value) is "[object Array]"

###
@param {*} value The value to check
@returns {Boolean} True if value is a Boolean
###
k$.isBoolean = (value) ->
  typeof value is "boolean"

###
@param {Object} value The value to check
@returns {Boolean} True if value is a Date object
###
k$.isDate = (value) ->
  Object::toString.call(value) is "[object Date]"

###
@param {*} value The value to check
@returns {Boolean} True if value is undefined
###
k$.isDefined = (value) ->
  typeof value isnt "undefined"

###
@param {*} value The value to check
@returns {Boolean} True if value is a Function
###
k$.isFunction = (value) ->
  typeof value is "function"

###
@param {*} value The value to check
@returns {Boolean} True if value is null
###
k$.isNull = (value) ->
  value is null

###
@param {*} value The value to check
@returns {Boolean} True if value is a Number
###
k$.isNumber = (value) ->
  typeof value is "number"

###
@param {*} value The value to check
@returns {Boolean} True if value is an Object, not including null
###
k$.isObject = (value) ->
  value isnt null and typeof value is "object"

###
@param {*} value The value to check
@returns {Boolean} True if value is a string
###
k$.isString = (value) ->
  typeof value is "string"

###
@param {*} value The value to check
@returns {Boolean} True if value is undefined
###
k$.isUndefined = (value) ->
  typeof value is "undefined"

###
Converts a String or Boolean value to a Boolean.

@param {String|Boolean} value The value to convert
@returns {Boolean} Returns true for any String that is not
null, empty String, or 'false'.  If value is a Boolean,
returns value
###
k$.convertToBoolean = (value) ->
  return value  if isBoolean(value)
  value isnt null and value isnt "" and value isnt "false"

###
Determines if obj has a property named prop.

@param {Object} obj The object to check
@returns {Boolean} Returns true if obj has a property named
prop.  Only considers the object's own properties
###
k$.hasProperty = (obj, prop) ->
  obj.hasOwnProperty prop

###
@param {*} value The value to check
@returns {Boolean} Returns true if value is a String
and has zero length, or if null or undefined
###
k$.isStringEmpty = (value) ->
  isNull(value) or isUndefined(value) or (isString(value) and (value.length is 0))

###
@param {*} value The value to check
@returns {Boolean} Returns true if value is a String
and has non-zero length
###
k$.isStringNonempty = (value) ->
  isString(value) and (value.length > 0)

###
Returns input with the first letter capitalized.
The input may not be zero length.

@param {String} input The String to capitalize.
@returns {String} Returns input with the first letter
capitalized.
###
k$.upperCaseFirstLetter = (input) ->
  input.charAt(0).toUpperCase() + input.slice(1)

###
Returns true if obj1 and obj2 are equal.  This should
only be used for Arrays, Objects, and value types.  This is a deep
comparison, comparing each property and recursive property to
be equal (not just ===).

Two Objects or values are considered equivalent if at least one of the following is true:
- Both objects or values pass `===` comparison.
- Both objects or values are of the same type and all of their properties pass areEqual
comparison.
- Both values are NaN. (In JavasScript, NaN == NaN => false. But we consider two NaN as equal).

Note, during property comparision, properties with function values are ignores as are property
names beginning with '$'.

See angular.equal for more details.

@param {Object|Array|value} obj1 The first object
@param {Object|Array|value} obj2 The second object
@returns {Boolean} True if the two objects are equal using a deep
comparison.
###
k$.areEqual = (obj1, obj2) ->
  angular.equals obj1, obj2

###
@param {Number} a The first Number
@param {Number} b The second Number
@returns {Number} The minimum of a and b
###
k$.min = (a, b) ->
  (if a < b then a else b)

###
@param {Number} a The first Number
@param {Number} b The second Number
@returns {Number} The maximum of a and b
###
k$.max = (a, b) ->
  (if a > b then a else b)

###
Returns true if the specified String begins with prefix.

@param {*} input The input to check
@ @param {String} prefix The prefix
@returns {Boolean} True if input is a string that begins with prefix
###
k$.beginsWith = (input, prefix) ->
  isString(input) and input.lastIndexOf(prefix, 0) is 0

###
Returns true if the specified String ends with prefix.

@param {*} input The input to check
@ @param {String} postfix The postfix
@returns {Boolean} True if input is a string that ends with postfix
###
k$.endsWith = (input, postfix) ->
  isString(input) and input.indexOf(postfix, input.length - postfix.length) isnt -1

###
Returns a deep copy of source, where source can be an Object or an Array.  If a destination is
provided, all of its elements (for Array) or properties (for Objects) are deleted and then all
elements/properties from the source are copied to it.   If source is not an Object or Array,
source is returned.

See angular.copy for more details.
@param {Object|Array} source The source
@param {Object|Array} destination Optional object to copy the elements to
@returns {Object|Array} The deep copy of source
###
k$.copy = (source, destination) ->
  angular.copy source, destination

###
Removes property from obj.

@param {Object} obj The object
@param {String} property The property name to delete
###
k$.removeProperty = (obj, property) ->
  delete obj[property]

###
Removes all properties in the array from obj.

@param {Object} obj The object
@param {Array} properties The properties to remove
###
k$.removeProperties = (obj, properties) ->
  i = 0

  while i < properties.length
    delete obj[properties[i]]
    ++i

###
Invokes the iterator function once for each item in obj collection, which can be either
an Object or an Array. The iterator function is invoked with iterator(value, key),
where value is the value of an object property or an array element and key is the
object property key or array element index. Specifying a context for the function is
optional.  If specified, it becomes 'this' when iterator function is invoked.

See angular.forEach for more details.

@param {Object|Array} The Object or Array over which to iterate
@param {Function} iterator The iterator function to invoke
@param {Object} context The value to set for 'this' when invoking the
iterator function. This is optional
###
k$.forEach = (obj, iterator, context) ->
  angular.forEach obj, iterator, context