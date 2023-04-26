import './App.css';
import {LogButtonClicks} from "./components/LogButtonClicks";
import {LogButtonClicks2} from "./components/LogButtonClicks2";
import {Stopwatch} from "./components/Stopwatch";
import {AccessingElement} from "./components/AccessingElement";
import {BrowserRouter, Routes, Route, Link} from "react-router-dom";
import {Home} from "./components/Home";
import {InputFocus} from "./components/InputFocus";
import {InputFocus2} from "./components/InputFocus2";
import {ANePasFaire} from "./components/ANePasFaire";
import ConditionalReturn1 from "./components/ConditionalReturn1";
import ConditionalReturn2 from "./components/ConditionalReturn2";
import ConditionalReturn3 from "./components/ConditionalReturn3";
import Forms from "./components/Forms";

function App() {
    return (
        <BrowserRouter>
            <nav>
                <ul>
                    <li>
                        <Link to="/">Home</Link>
                    </li>
                    <li>
                        <Link to="/logbuttonclicks">Log button clicks</Link>
                    </li>
                    <li>
                        <Link to="/logbuttonclicks2">Log button clicks 2</Link>
                    </li>
                    <li>
                        <Link to="/stopwatch">Stopwatch</Link>
                    </li>
                    <li>
                        <Link to="/elements">Accessing elements</Link>
                    </li>
                    <li>
                        <Link to="/focus">Input Focus</Link>
                    </li>
                    <li>
                        <Link to="/focus2">Input Focus 2</Link>
                    </li>
                    <li>
                        <Link to="/anepasfaire">A ne pas faire</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn1">ConditionalReturn 1</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn2">ConditionalReturn 2</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn3">ConditionalReturn 3</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn4">ConditionalReturn 4</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn5">ConditionalReturn 5</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn6">ConditionalReturn 6</Link>
                    </li>
                    <li>
                        <Link to="/conditionalreturn7">ConditionalReturn 7</Link>
                    </li>
                    <li>
                        <Link to="/forms">forms</Link>
                    </li>
                </ul>
            </nav>
            <Routes>
                <Route path="/" element={<Home/>}/>
                <Route path="/logbuttonclicks" element={<LogButtonClicks/>}/>
                <Route path="/logbuttonclicks2" element={<LogButtonClicks2/>}/>
                <Route path="/stopwatch" element={<Stopwatch/>}/>
                <Route path="/elements" element={<AccessingElement/>}/>
                <Route path="/focus" element={<InputFocus/>}/>
                <Route path="/focus2" element={<InputFocus2/>}/>
                <Route path="/anepasfaire" element={<ANePasFaire/>}/>
                <Route path="/conditionalreturn1" element={
                    <ConditionalReturn1 condition={null} text="nothing"/>
                }/>
                <Route path="/conditionalreturn2" element={
                    <ConditionalReturn1 condition={true} text="Something"/>
                }/>
                <Route path="/conditionalreturn3" element={
                    <ConditionalReturn1 condition={false} text="Falsy"/>
                }/>
                <Route path="/conditionalreturn4" element={
                    <ConditionalReturn2 condition={false} text="Falsy"/>
                }/>
                <Route path="/conditionalreturn5" element={
                    <ConditionalReturn2 condition={true} text="Not Falsy"/>
                }/>
                <Route path="/conditionalreturn6" element={
                    <ConditionalReturn3 condition={false} text1="Text1" text2="text2"/>
                }/>
                <Route path="/conditionalreturn7" element={
                    <ConditionalReturn3 condition={true} text1="Text1" text2="text2"/>
                }/>
                <Route path="/forms" element={
                    <Forms/>
                }/>
            </Routes>
        </BrowserRouter>
    );
}

export default App;
