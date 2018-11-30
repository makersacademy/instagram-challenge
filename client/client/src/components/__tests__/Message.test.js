import React from 'react';
import { shallow } from 'enzyme';
import Message from '../Message';


describe("Message", function() {
  let mountedMessage;
  beforeEach(()=>{
    mountedMessage = shallow(<Message />);
  })
  it('renders without crashing', () => {
    shallow(<Message />);
  })

});
