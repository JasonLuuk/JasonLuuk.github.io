import encoding.json.*
import std.collection.*

main() {
    var a: JsonValue = JsonNull()
    var b: JsonValue = JsonBool(true)

    var d: JsonValue = JsonInt(7363)
    var e: JsonValue = JsonFloat(736423.546)
    var list: ArrayList<JsonValue> = ArrayList<JsonValue>()

    var map1 = JsonObject()
    map1.put("a", JsonString("jjjjjj"))
    map1.put("b", b)
    map1.put("c", JsonString("hhhhh"))

    list.append(b)
    list.append(a)

    list.append(d)
    list.append(JsonString("ddddddd"))
    list.append(e)
    var result: JsonValue = JsonArray(list)
    println("func toString result is:")
    println(result.toString())
    println("func toJsonString result is:")
    println(result.toJsonString())

    var str = ##"[true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,{"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]"##
    var jv: JsonValue = JsonValue.fromStr(str)

    println(jv.toString())
    println(jv.toJsonString())
}

// Output:
// func toString result is:
// [true,null,7363,"ddddddd",736423.546]
// func toJsonString result is:
// [
//   true,
//   null,
//   7363,
//   "ddddddd",
//   736423.546
// ]
// [true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,{"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]
// [
//   true,
//   "kjjjke\"eed",
//   {
//     "sdfd": "ggggg",
//     "eeeee": [
//       341,
//       false,
//       {
//         "nnnn": 55.87
//       }
//     ]
//   },
//   3422,
//   22.341,
//   false,
//   [
//     22,
//     22.22,
//     true,
//     "ddd"
//   ],
//   43
// ]
