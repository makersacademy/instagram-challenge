import React from 'react';
import { shallow } from 'enzyme';
import Posts from '../Posts';


describe("Posts", function() {
  let mountedPosts;
  beforeEach(()=>{
    mountedPosts = shallow(<Posts />);
  })
  it('renders without crashing', () => {
    shallow(<Posts />);
  })

});
