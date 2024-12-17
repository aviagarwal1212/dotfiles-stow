(println "my name is avi")

(def a 10)

(let [name "avi"
      age 10]  
  (println (str "My name is " name))
  (println (str "I am " age " years old")))

(let [a "aaa"]
  (let [a "AAA"]
    (println a))
  (println a))
