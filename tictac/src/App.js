import logo from './logo.svg';
import './App.css';

function App() {
  let name = 'Tanaka';
  return (
    <div>
    <h1 className='title'>Hello</h1>
    <p className='sub'> This is ...</p>
    <h2>Hello {name}!</h2>
    <div className="App">
      <header className="App-header">
        <img src={'/picture/kumo.png'} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>

        
        
        
        <a
          className="App-link"
          href="https://www.supremenewyork.com/shop"
          target="_blank"
          rel="noopener noreferrer"
        >
          <h1 className="sup">
            Go To Fuck'n Supreme
            </h1>
        </a>
      </header>
      </div>
    </div>
  );
}

export default App;
