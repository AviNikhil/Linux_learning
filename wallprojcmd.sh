sudo apt-get update
sudo apt-get install nodejs npm -y
cd /home/nikhil/wallback/
./mvnw clean package
mvn clean install
cd /home/nikhil/wallfront/
npm install
npm install axios
npm install react-router-dom
npm start
java -jar /home/nikhil/wallback/target/CapstoneProject-0.0.1-SNAPSHOT.jar &

echo "Application is running successfully"
