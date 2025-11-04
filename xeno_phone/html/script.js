window.addEventListener('message', function(event) {
  const data = event.data;

  if (data.action === 'toggle') {
    document.getElementById('phone').classList.toggle('hidden', !data.show);
  }

  if (data.action === 'newMessage') {
    const div = document.createElement('div');
    div.innerText = `${data.sender}: ${data.message}`;
    document.getElementById('messages').appendChild(div);
  }
});

document.getElementById('closeBtn').addEventListener('click', () => {
  fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' });
});

document.getElementById('sendBtn').addEventListener('click', () => {
  const number = document.getElementById('number').value;
  const message = document.getElementById('message').value;

  fetch(`https://${GetParentResourceName()}/sendMessage`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify({ number, message })
  });
});
